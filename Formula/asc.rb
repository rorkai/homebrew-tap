# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.1.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.1.0/asc_6.1.0_macOS_arm64'
      sha256 'd87efb0680df70a59ebb64a138ba4d3cf30e12341cdc5d9e9bcfdeb2f5154de9'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.1.0/asc_6.1.0_macOS_amd64'
      sha256 'b8374bba9ce1b4bc6f30d28f69966135fdc264ee368900062251ae0f53eff644'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.1.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.1.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
