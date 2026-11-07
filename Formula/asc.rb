# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.5.2'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.5.2/asc_6.5.2_macOS_arm64'
      sha256 '4caae0c40db5efac783032b91bfe070e787cdd1da421783c0339af0adbc39d15'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.5.2/asc_6.5.2_macOS_amd64'
      sha256 '4192f4d458b7cdc35b19a604cfc08f5d2dc576f9b0c8590c1059bcb461b0c825'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.5.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.5.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
