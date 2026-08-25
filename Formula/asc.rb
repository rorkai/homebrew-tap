# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.9.2'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.9.2/asc_4.9.2_macOS_arm64'
      sha256 'b5389ac19f33f2be6fbf3e312cbdb7f26d08d16ab2023a778a1cd37d6e8d6ac5'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.9.2/asc_4.9.2_macOS_amd64'
      sha256 'b8f480df032af393beee211791b9d1a622838c3957363844b8c6eefdba759a89'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.9.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.9.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
